#!/bin/bash
set -e

echo "🚀 Setting up Plane development environment..."

# Install pnpm dependencies
echo "📦 Installing dependencies with pnpm..."
pnpm install

# Generate environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Generating .env file from .env.example..."
    cp .env.example .env
    echo "✅ .env file created"
fi

# Set up database
if command -v psql &> /dev/null; then
    echo "🗄️  Setting up PostgreSQL..."
    # Wait for DB to be ready
    until psql -h db -U plane -d plane -c "SELECT 1" &>/dev/null; do
        echo "⏳ Waiting for PostgreSQL to be ready..."
        sleep 2
    done
    echo "✅ PostgreSQL is ready"
fi

echo "✅ Development environment setup complete!"
echo ""
echo "📋 Available commands:"
echo "  pnpm dev           - Start all development servers"
echo "  pnpm build         - Build all packages"
echo "  pnpm check         - Run all checks (format, lint, types)"
echo "  pnpm fix           - Auto-fix format and lint issues"
echo ""
echo "🌐 Port forwarding:"
echo "  Web (Next.js):     http://localhost:3000"
echo "  Admin (Next.js):   http://localhost:3001"
echo "  Storybook:         http://localhost:6006"
echo "  MinIO Console:     http://localhost:9090"
echo ""
