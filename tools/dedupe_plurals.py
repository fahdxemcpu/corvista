"""Remove plural keyword branches (zero/one/two) that duplicate an explicit
=0/=1/=2 branch in the same ICU plural, which gen-l10n warns about."""
import json, re, sys

PAIRS = {'zero': '=0', 'one': '=1', 'two': '=2'}

def branches(body, start):
    """Yield (selector, sel_start, block_end) for branches at depth of a plural body."""
    i = start
    out = []
    while i < len(body):
        m = re.compile(r'\s*(=\d+|zero|one|two|few|many|other)\s*\{').match(body, i)
        if not m: break
        sel = m.group(1); j = m.end(); depth = 1
        while depth and j < len(body):
            if body[j] == '{': depth += 1
            elif body[j] == '}': depth -= 1
            j += 1
        out.append((sel, i, j)); i = j
    return out, i

def fix(msg):
    changed = True
    while changed:
        changed = False
        for m in re.finditer(r'\{\s*\w+\s*,\s*plural\s*,', msg):
            bs, _ = branches(msg, m.end())
            sels = {b[0] for b in bs}
            for sel, a, b in bs:
                if sel in PAIRS and PAIRS[sel] in sels:
                    msg = msg[:a] + msg[b:]; changed = True; break
            if changed: break
    return msg

for path in sys.argv[1:]:
    d = json.load(open(path)); n = 0
    for k, v in list(d.items()):
        if k.startswith('@') or not isinstance(v, str) or 'plural' not in v: continue
        f = fix(v)
        if f != v: d[k] = f; n += 1
    if n:
        json.dump(d, open(path, 'w'), ensure_ascii=False, indent=2); open(path, 'a').write('\n')
    print(path, 'fixed', n)
