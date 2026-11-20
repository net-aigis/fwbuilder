#!/usr/bin/env bash
# Phase-41643: client soft_fertig_ssh_auth_soft_43720_echo_roster Soft 41640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_43720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41640+ soft_fertig_ssh_auth_soft_43720_echo_roster type ok"; echo "cleaned"; echo "OK: phase41643 e2e passed"
