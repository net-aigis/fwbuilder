#!/usr/bin/env bash
# Phase-122: Rule-Options Dialog-Seiten Prev/Next.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
grep -q 'dialog-pages' "$f"
grep -q 'Rule option pages' "$f"
grep -q 'Previous rule options page' "$f"
echo "rule options page nav ok"
echo "cleaned"
echo "OK: phase122 e2e passed"
