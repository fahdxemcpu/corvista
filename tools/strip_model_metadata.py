"""Remove identifying descriptive metadata from compiled Core ML bundles
(.mlmodelc/metadata.json): author, description, license, version and the
original model file name. Keeps the I/O schema, class labels and the
`com.apple.coreml.model.preview.params` labels list (used at load time to
verify segmentation class indices). Provenance stays documented in
docs/MODELS.md and the in-app open-source licences page."""
import json, sys

KEEP_UDM = {'com.apple.coreml.model.preview.params'}
for path in sys.argv[1:]:
    p = f'{path}/metadata.json'
    data = json.load(open(p))
    for m in data:
        for k in ('author', 'shortDescription', 'license', 'version', 'generatedClassName'):
            if k in m: m[k] = ''
        udm = m.get('userDefinedMetadata') or {}
        m['userDefinedMetadata'] = {k: v for k, v in udm.items() if k in KEEP_UDM}
        for io in m.get('inputSchema', []) + m.get('outputSchema', []):
            if 'shortDescription' in io: io['shortDescription'] = ''
    json.dump(data, open(p, 'w'), indent=2)
    print('stripped', p)
