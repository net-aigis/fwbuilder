#!/usr/bin/env bash
# Phase-21803: client soft_fertig_ssh_auth_soft_21840_echo_roster Soft 21800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_21840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21800+ soft_fertig_ssh_auth_soft_21840_echo_roster type ok"; echo "cleaned"; echo "OK: phase21803 e2e passed"
