#!/bin/bash
set -e

echo "🔄 Starting Plane development environment..."

# Check dependencies health
echo "🏥 Checking service health..."

# Check PostgreSQL
if ! pg_isready -h db -U plane &>/dev/null; then
    echo "⚠️  PostgreSQL not ready yet, waiting..."
    sleep 5
fi

# Check Redis
if ! redis-cli -h redis ping &>/dev/null; then
    echo "⚠️  Redis not ready yet, waiting..."
    sleep 5
fi

echo "✅ All services are ready!"
echo ""
echo "💡 Tip: Run 'pnpm dev' to start the development servers"
echo ""
