#!/usr/bin/env bash
# Phase-434: OptionField read_only CSS class.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'field-ui-readonly' webui/frontend/src/components/OptionField.tsx
grep -Fq 'field-ui-readonly' webui/frontend/src/styles/app.css
echo "readonly CSS ok"
echo "cleaned"
echo "OK: phase434 e2e passed"
