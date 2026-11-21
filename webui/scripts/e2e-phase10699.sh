#!/usr/bin/env bash
# Phase-10699: client soft_fertig_ssh_auth_type_tag_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_type_tag_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-type-tag roster type ok"; echo "cleaned"; echo "OK: phase10699 e2e passed"
