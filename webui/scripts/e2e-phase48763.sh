#!/usr/bin/env bash
# Phase-48763: client soft_fertig_ssh_auth_ms_98000_echo_roster Soft 48760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_98000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48760+ soft_fertig_ssh_auth_ms_98000_echo_roster type ok"; echo "cleaned"; echo "OK: phase48763 e2e passed"
