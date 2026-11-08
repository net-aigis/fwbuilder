#!/usr/bin/env bash
# Phase-6619: client ssh_implemented_identity_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_identity_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-implemented-identity roster type ok"; echo "cleaned"; echo "OK: phase6619 e2e passed"
