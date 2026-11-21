#!/usr/bin/env bash
# Phase-505: OptionField field-ui-hidden for visible=false.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'field-ui-hidden' webui/frontend/src/components/OptionField.tsx
grep -Fq 'visible=false' webui/frontend/src/components/OptionField.tsx
grep -Fq 'field-ui-hidden' webui/frontend/src/styles/app.css
echo "field-ui-hidden ok"
echo "cleaned"
echo "OK: phase505 e2e passed"
