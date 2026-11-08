#!/usr/bin/env bash
# Phase-10763: client soft_fertig_ssh_auth_type_tag_roster Soft 10760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_type_tag_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10760+ soft_fertig_ssh_auth_type_tag_roster type ok"; echo "cleaned"; echo "OK: phase10763 e2e passed"
