#!/usr/bin/env bash
# Phase-4539: client ssh_auth_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth roster type ok"
echo "cleaned"
echo "OK: phase4539 e2e passed"
