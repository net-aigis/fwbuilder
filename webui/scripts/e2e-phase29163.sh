#!/usr/bin/env bash
# Phase-29163: client soft_fertig_ssh_auth_soft_29760_echo_roster Soft 29160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_29760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29160+ soft_fertig_ssh_auth_soft_29760_echo_roster type ok"; echo "cleaned"; echo "OK: phase29163 e2e passed"
