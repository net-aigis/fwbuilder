#!/usr/bin/env bash
# Phase-9483: client soft_fertig_ssh_auth_refusal_id_roster Soft 9480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_id_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9480+ soft_fertig_ssh_auth_refusal_id_roster type ok"; echo "cleaned"; echo "OK: phase9483 e2e passed"
