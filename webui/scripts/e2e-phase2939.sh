#!/usr/bin/env bash
# Phase-2939: client soft_fertig_ssh_honesty_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_honesty_roster?:' webui/frontend/src/api/client.ts
echo "client SSH honesty roster type ok"
echo "cleaned"
echo "OK: phase2939 e2e passed"
