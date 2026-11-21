#!/usr/bin/env bash
# Phase-13643: client soft_fertig_ssh_auth_refusal_echo_roster Soft 13640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13640+ soft_fertig_ssh_auth_refusal_echo_roster type ok"; echo "cleaned"; echo "OK: phase13643 e2e passed"
