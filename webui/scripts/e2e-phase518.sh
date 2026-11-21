#!/usr/bin/env bash
# Phase-518: STATUS 513–520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase513\|e2e-phase513' webui/STATUS.md
grep -q 'phase520\|e2e-phase520' webui/STATUS.md
grep -qi 'schema_summary\|signal_key_count\|InterfaceOptions\|RuleOptions' webui/STATUS.md
echo "STATUS 513-520 ok"
echo "cleaned"
echo "OK: phase518 e2e passed"
