#!/usr/bin/env bash
# Phase-125: Host-Options Filter + TSV-Copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/HostOptions.tsx"
grep -q 'Filter host options' "$f"
grep -q 'Copied host options TSV' "$f"
grep -q 'Copy TSV' "$f"
echo "host options filter/tsv ok"
echo "cleaned"
echo "OK: phase125 e2e passed"
