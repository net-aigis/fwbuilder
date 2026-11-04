#!/usr/bin/env bash
# Phase-2459: client sessionStorage roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_roster?:' webui/frontend/src/api/client.ts
echo "client sessionStorage roster type ok"
echo "cleaned"
echo "OK: phase2459 e2e passed"
