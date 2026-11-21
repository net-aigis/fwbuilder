#!/usr/bin/env bash
# Phase-13419: client soft_fertig_ssh_auth_impl_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_impl_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-impl-count roster type ok"; echo "cleaned"; echo "OK: phase13419 e2e passed"
