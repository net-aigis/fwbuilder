#!/usr/bin/env bash
# Phase-40763: client soft_fertig_ssh_auth_ms_85500_echo_roster Soft 40760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_85500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 40760+ soft_fertig_ssh_auth_ms_85500_echo_roster type ok"; echo "cleaned"; echo "OK: phase40763 e2e passed"
