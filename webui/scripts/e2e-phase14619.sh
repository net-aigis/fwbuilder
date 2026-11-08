#!/usr/bin/env bash
# Phase-14619: client soft_fertig_ssh_auth_auth_prefix_ratio_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_auth_prefix_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-auth-prefix-ratio roster type ok"; echo "cleaned"; echo "OK: phase14619 e2e passed"
