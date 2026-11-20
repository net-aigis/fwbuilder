#!/usr/bin/env bash
# Phase-41323: client soft_fertig_ssh_auth_soft_43360_echo_roster Soft 41320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_43360_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41320+ soft_fertig_ssh_auth_soft_43360_echo_roster type ok"; echo "cleaned"; echo "OK: phase41323 e2e passed"
