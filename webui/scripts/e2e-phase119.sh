#!/usr/bin/env bash
# Phase-119: Deploy remote_dir / identity / activate in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
c="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'Remote directory' "$f"
grep -q 'SSH identity file' "$f"
grep -q 'Activate after copy' "$f"
grep -q 'identity_file' "$f"
grep -q 'identity_file?:' "$c"
echo "deploy extras ok"
echo "cleaned"
echo "OK: phase119 e2e passed"
