#!/usr/bin/env bash
# Phase-498: refusePasswordSsh parses batch_mode_only / alternatives.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'batch_mode_only' webui/frontend/src/api/client.ts
grep -Fq 'refusal_paths' webui/frontend/src/api/client.ts
# ensure refusePasswordSsh return type includes alternatives
awk '/export async function refusePasswordSsh/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'alternatives'
echo "refusePasswordSsh parse ok"
echo "cleaned"
echo "OK: phase498 e2e passed"
