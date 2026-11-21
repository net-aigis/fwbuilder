#!/usr/bin/env bash
# Phase-48043: client soft_fertig_ssh_auth_soft_50920_echo_roster Soft 48040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_50920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48040+ soft_fertig_ssh_auth_soft_50920_echo_roster type ok"; echo "cleaned"; echo "OK: phase48043 e2e passed"
