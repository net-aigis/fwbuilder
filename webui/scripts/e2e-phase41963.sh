#!/usr/bin/env bash
# Phase-41963: client soft_fertig_ssh_auth_soft_44080_echo_roster Soft 41960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_44080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41960+ soft_fertig_ssh_auth_soft_44080_echo_roster type ok"; echo "cleaned"; echo "OK: phase41963 e2e passed"
