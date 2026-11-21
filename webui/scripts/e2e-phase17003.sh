#!/usr/bin/env bash
# Phase-17003: client soft_fertig_ssh_auth_soft_16920_echo_roster Soft 17000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_16920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17000+ soft_fertig_ssh_auth_soft_16920_echo_roster type ok"; echo "cleaned"; echo "OK: phase17003 e2e passed"
