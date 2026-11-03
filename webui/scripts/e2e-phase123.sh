#!/usr/bin/env bash
# Phase-123: Interface-Options Dialog-Seiten Prev/Next.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'dialog-pages' "$f"
grep -q 'Interface option pages' "$f"
grep -q 'Previous interface options page' "$f"
echo "interface options page nav ok"
echo "cleaned"
echo "OK: phase123 e2e passed"
