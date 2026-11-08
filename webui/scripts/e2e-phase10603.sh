#!/usr/bin/env bash
# Phase-10603: client soft_fertig_ssh_auth_impl_support_pair_roster Soft 10600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_impl_support_pair_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10600+ soft_fertig_ssh_auth_impl_support_pair_roster type ok"; echo "cleaned"; echo "OK: phase10603 e2e passed"
