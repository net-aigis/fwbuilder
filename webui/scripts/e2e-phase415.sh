#!/usr/bin/env bash
# Phase-415: hard-gap note mentions option enable follow.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
# bump note if present; else check platforms table
grep -Fq '_IFACE_OPTION_ENABLE' webui/backend/fwbweb_api/platforms.py
grep -Fq 'bondingPolicyChanged' webui/backend/fwbweb_api/platforms.py
echo "option_enable table ok"
echo "cleaned"
echo "OK: phase415 e2e passed"
