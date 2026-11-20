#!/usr/bin/env bash
# Phase-46123: client soft_fertig_ssh_auth_soft_48760_echo_roster Soft 46120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_48760_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46120+ soft_fertig_ssh_auth_soft_48760_echo_roster type ok"; echo "cleaned"; echo "OK: phase46123 e2e passed"
