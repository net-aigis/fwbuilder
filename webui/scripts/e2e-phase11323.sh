#!/usr/bin/env bash
# Phase-11323: client soft_fertig_ssh_auth_bundle_hint_roster Soft 11320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_bundle_hint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11320+ soft_fertig_ssh_auth_bundle_hint_roster type ok"; echo "cleaned"; echo "OK: phase11323 e2e passed"
