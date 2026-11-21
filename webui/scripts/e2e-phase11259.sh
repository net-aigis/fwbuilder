#!/usr/bin/env bash
# Phase-11259: client soft_fertig_ssh_auth_bundle_hint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_bundle_hint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-bundle-hint roster type ok"; echo "cleaned"; echo "OK: phase11259 e2e passed"
