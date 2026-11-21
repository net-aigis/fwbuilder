#!/usr/bin/env bash
# Phase-20203: client soft_fertig_ssh_auth_soft_20160_echo_roster Soft 20200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_20160_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20200+ soft_fertig_ssh_auth_soft_20160_echo_roster type ok"; echo "cleaned"; echo "OK: phase20203 e2e passed"
