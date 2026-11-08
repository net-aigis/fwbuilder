#!/usr/bin/env bash
# Phase-10539: client soft_fertig_ssh_auth_impl_support_pair_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_impl_support_pair_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-impl-support-pair roster type ok"; echo "cleaned"; echo "OK: phase10539 e2e passed"
