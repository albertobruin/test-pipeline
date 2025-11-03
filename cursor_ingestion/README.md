# Cursor Ingestion Pipeline

This pipeline ingests data from Cursor API into DuckDB using Bruin's ingestr data pipeline.

## Overview

The pipeline extracts the following datasets from Cursor:
- **Team Members** - Team member information including names, emails, and roles
- **Daily Usage Data** - Daily usage statistics including lines added/deleted, AI requests, model usage (supports optional date filtering)
- **Team Spend** - Team spending data for the current billing cycle
- **Filtered Usage Events** - Detailed usage events with timestamps, models, token usage, and costs (supports optional date filtering)

## Setup

### 1. Verify Cursor Connection in `.bruin.yml`

The Cursor connection should already be configured in your `.bruin.yml` file:

```yaml
environments:
    default:
        connections:
            cursor:
                - name: my-cursor
                  api_key: "your_api_key_here"
```

To get your Cursor API key:
1. Go to your Cursor team settings
2. Navigate to API settings
3. Generate or copy your API key

### 2. Verify DuckDB Connection

The DuckDB connection should be configured in `.bruin.yml`:

```yaml
environments:
    default:
        connections:
            duckdb:
                - name: duckdb-default
                  path: "/path/to/your/duckdb/database.db"
```

## Running the Pipeline

### Validate the Pipeline

Before running, validate your pipeline configuration:

```bash
bruin validate cursor_ingestion
```

### Test Connections

Test if your connections are working:

```bash
bruin connections ping my-cursor
bruin connections ping duckdb-default
```

### Run Individual Assets

Run specific assets individually:

```bash
# Run team members ingestion
bruin run cursor_ingestion/assets/team_members.asset.yml

# Run daily usage data ingestion
bruin run cursor_ingestion/assets/daily_usage_data.asset.yml

# Run team spend ingestion
bruin run cursor_ingestion/assets/team_spend.asset.yml

# Run filtered usage events ingestion
bruin run cursor_ingestion/assets/filtered_usage_events.asset.yml
```

### Run the Entire Pipeline

To run all assets in the pipeline:

```bash
bruin run cursor_ingestion
```

## Available Source Tables

| Table | PK | Inc Key | Inc Strategy | Details |
|-------|----|---------|--------------|---------|
| `team_members` | - | - | replace | Team member information including names, emails, and roles |
| `daily_usage_data` | - | - | replace | Daily usage statistics including lines added/deleted, AI requests, model usage. Supports optional date filtering |
| `team_spend` | - | - | replace | Team spending data for the current billing cycle |
| `filtered_usage_events` | - | - | replace | Detailed usage events with timestamps, models, token usage, and costs. Supports optional date filtering |

## Notes

- **Authentication**: The Cursor API uses API key authentication.

- **Date Range Limit**: The `daily_usage_data` and `filtered_usage_events` endpoints have a 30-day limit per request. If you need more than 30 days of historical data, make multiple requests with different date ranges.

- **Date Filtering**: `daily_usage_data` and `filtered_usage_events` tables support optional date filtering. When dates are provided, only data within that range is fetched. When dates are omitted, the API returns default data (typically last 30 days).

- **DuckDB Concurrency**: DuckDB does not allow concurrency between different processes. Ensure other clients are not connected to the database while Bruin is running.

## Data Models

### Team Members
Contains team member information with names, emails, and roles.

### Daily Usage Data
Contains daily aggregated usage statistics including:
- Lines of code added/deleted
- AI requests count
- Model usage statistics

### Team Spend
Contains current billing cycle spending information.

### Filtered Usage Events
Contains detailed event-level data including:
- Timestamps
- Model used
- Token usage
- Costs per event

