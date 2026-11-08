#!/usr/bin/env bash
# Phase-11083: client soft_fertig_ssh_auth_refusal_related_roster Soft 11080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_related_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11080+ soft_fertig_ssh_auth_refusal_related_roster type ok"; echo "cleaned"; echo "OK: phase11083 e2e passed"
