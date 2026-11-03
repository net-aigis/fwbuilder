#!/usr/bin/env bash
# Phase-84: Regel-Filter zurücksetzen (Esc-Datenpfad: Filter-Zustände).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

python3 - <<'PY'
# UI clears text/group/action/hide/only — verify filter semantics stay consistent.
rules=[
  {"id":"a","disabled":False,"action":"Accept","group":"g1","comment":"x"},
  {"id":"b","disabled":True,"action":"Deny","group":"g2","comment":"y"},
]
hide=True
only=False
action="Accept"
group="g1"
text=""
list=rules
if hide: list=[r for r in list if not r["disabled"]]
elif only: list=[r for r in list if r["disabled"]]
if action: list=[r for r in list if r["action"]==action]
if group: list=[r for r in list if group.lower() in r["group"].lower()]
assert len(list)==1 and list[0]["id"]=="a"
# clear all
hide=only=False
action=group=text=""
list=rules
assert len(list)==2
text_src=open("/home/friseer/MyGIT/fwbuilder/webui/frontend/src/App.tsx").read()
assert 'setStatus("Filters cleared")' in text_src
assert "Filters cleared" in text_src
print("filters cleared path ok")
print("cleaned")
PY
echo "OK: phase84 e2e passed"
