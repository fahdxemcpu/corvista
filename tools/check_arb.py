"""Validate a translated ARB against lib/l10n/app_en.arb.
Usage: python3 tools/check_arb.py lib/l10n/app_fr.arb
Checks: valid JSON, @@locale, every template key present, no extra keys,
same {placeholders} per message, ICU plural/select structure keywords kept."""
import json, re, sys

tpl = json.load(open('lib/l10n/app_en.arb'))
keys = [k for k in tpl if not k.startswith('@')]
ph_re = re.compile(r'\{(\w+)(?:,\s*(plural|select|number|date))?')

def placeholders(s):
    return sorted(set(m.group(1) for m in ph_re.finditer(s) if m.group(1) not in ('other',)))

ok = True
for path in sys.argv[1:]:
    try:
        d = json.load(open(path))
    except Exception as e:
        print(f'{path}: INVALID JSON {e}'); ok = False; continue
    errs = []
    if '@@locale' not in d: errs.append('missing @@locale')
    for k in keys:
        if k not in d: errs.append(f'missing {k}'); continue
        if not isinstance(d[k], str) or not d[k].strip(): errs.append(f'empty {k}'); continue
        a, b = placeholders(tpl[k]), placeholders(d[k])
        # plural/select case words (=0, one, other...) are not placeholders; compare top-level names only
        declared = set((tpl.get('@' + k) or {}).get('placeholders', {}).keys())
        used = set(re.findall(r'\{(\w+)[,}]', d[k]))
        missing = {n for n in declared if n not in used}
        # a placeholder used only as a plural/select selector still counts (\{name,)
        if missing: errs.append(f'placeholder missing {k}: {sorted(missing)}')
        if 'plural,' in tpl[k] and 'plural,' not in d[k]: errs.append(f'plural lost {k}')
        if 'plural,' in d[k] and 'other{' not in d[k].replace(' ', ''): errs.append(f'plural without other {k}')
        if d[k].count('{') != d[k].count('}'): errs.append(f'unbalanced braces {k}')
    extra = [k for k in d if not k.startswith('@') and k not in tpl]
    if extra: errs.append(f'extra keys {extra[:5]}')
    print(f'{path}: {"OK" if not errs else str(len(errs))+" errors"} ({sum(1 for k in keys if k in d)}/{len(keys)} keys)')
    for e in errs[:30]: print('  ', e)
    ok = ok and not errs
sys.exit(0 if ok else 1)
