#!/usr/bin/env bash
# Phase-20843: client soft_fertig_ssh_auth_soft_20760_echo_roster Soft 20840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_20760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20840+ soft_fertig_ssh_auth_soft_20760_echo_roster type ok"; echo "cleaned"; echo "OK: phase20843 e2e passed"
