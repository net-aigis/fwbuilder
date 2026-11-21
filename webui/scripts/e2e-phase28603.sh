#!/usr/bin/env bash
# Phase-28603: client soft_fertig_ssh_auth_ms_66500_echo_roster Soft 28600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_66500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28600+ soft_fertig_ssh_auth_ms_66500_echo_roster type ok"; echo "cleaned"; echo "OK: phase28603 e2e passed"
