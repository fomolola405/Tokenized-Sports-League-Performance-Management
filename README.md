# Tokenized Sports League Performance Management

A comprehensive blockchain-based sports league management system built with Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a complete solution for managing sports leagues, including administrator verification, player performance tracking, team coordination, season management, and statistics aggregation.

## Features

### 🏆 Core Contracts

1. **League Administrator Verification** (`league-admin.clar`)
    - Manages league administrators and their permissions
    - Secure role-based access control
    - Multi-admin support with owner privileges

2. **Player Performance Contract** (`player-performance.clar`)
    - Tracks individual player statistics and performance metrics
    - Manages player contracts and salary information
    - Calculates performance scores and bonuses

3. **Team Coordination Contract** (`team-coordination.clar`)
    - Manages team creation and roster management
    - Handles game scheduling and coordination
    - Tracks team information and venues

4. **Season Management Contract** (`season-management.clar`)
    - Creates and manages league seasons
    - Tracks team standings and win/loss records
    - Handles season start/end and championship declarations

5. **Statistics Aggregation Contract** (`statistics-aggregation.clar`)
    - Aggregates league-wide and team statistics
    - Calculates player rankings and team efficiency ratings
    - Provides comprehensive analytics and reporting

## Getting Started

### Prerequisites

- Clarinet CLI tool
- Node.js (for testing)
- Stacks wallet for deployment

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd tokenized-sports-league
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Contract Deployment

1. Deploy contracts in the following order:
    - `league-admin.clar`
    - `player-performance.clar`
    - `team-coordination.clar`
    - `season-management.clar`
    - `statistics-aggregation.clar`

2. Initialize the system by adding administrators and creating the first season.

## Usage Examples

### Adding an Administrator
\`\`\`clarity
(contract-call? .league-admin add-administrator 'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNP)
\`\`\`

### Creating a Team
\`\`\`clarity
(contract-call? .team-coordination create-team "Lakers" 'SP1COACH... "Staples Center")
\`\`\`

### Updating Player Stats
\`\`\`clarity
(contract-call? .player-performance update-player-stats
'SP1PLAYER... u10 u250 u80 u120 u1)
\`\`\`

### Starting a Season
\`\`\`clarity
(contract-call? .season-management start-season u1)
\`\`\`

## Contract Architecture

The system follows a modular architecture where each contract handles specific functionality:

- **Separation of Concerns**: Each contract has a single responsibility
- **Access Control**: Administrator verification is centralized
- **Data Integrity**: Cross-contract validation ensures data consistency
- **Scalability**: Modular design allows for easy expansion

## Security Features

- Role-based access control through administrator verification
- Input validation on all public functions
- Error handling with descriptive error codes
- Immutable contract deployment ensures system integrity

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test                    # Run all tests
npm run test:watch         # Run tests in watch mode
npm run test:coverage      # Generate coverage report
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.

