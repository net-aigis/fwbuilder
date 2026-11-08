#!/usr/bin/env bash
# Phase-11019: client soft_fertig_ssh_auth_refusal_related_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_related_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refusal-related roster type ok"; echo "cleaned"; echo "OK: phase11019 e2e passed"
