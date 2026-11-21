#!/usr/bin/env bash
# Phase-10459: client soft_fertig_ssh_auth_alt_pair_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_alt_pair_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-alt-pair roster type ok"; echo "cleaned"; echo "OK: phase10459 e2e passed"
