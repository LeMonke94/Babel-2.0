// Imports
import 'dotenv/config';
import { defineConfig, env } from 'prisma/config';

// Path configurations for Prisma
export default defineConfig({
  schema: 'prisma/schema',
  migrations: {
    path: 'prisma/migrations',
  },
  // Database location
  datasource: {
    url: env('DATABASE_URL'),
  },
});