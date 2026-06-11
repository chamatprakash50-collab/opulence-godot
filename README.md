# Opulence - The India Property Game (Godot 4.6 Edition)

A complete conversion of the HTML-based Opulence property trading game into Godot 4.6, preserving all original game mechanics and logic.

## Features

- 🎮 **Full Gameplay Preserved** - Identical mechanics to the HTML version
- 🏠 **40 Indian Properties** - Agra, Delhi, Mumbai, Bengaluru & more
- 👥 **4-12 Player Support** - Custom games with unique Indian characters
- 💰 **Property Trading** - Buy, mortgage, and build houses
- 🎲 **Dynamic Dice System** - With smooth animations
- 🏆 **Win Conditions** - Multiple victory paths
- ⚙️ **Settings System** - Sound, music, auto-advance options
- 📊 **Real-time Scoring** - Live leaderboard and game log

## Requirements

- **Godot Engine 4.6+**
- **GDScript** (built-in)

## Getting Started

1. **Clone this repository**
   ```bash
   git clone https://github.com/chamatprakash50-collab/opulence-godot.git
   ```

2. **Open in Godot 4.6+**
   - Launch Godot
   - Click "Open Project"
   - Select the `opulence-godot` folder
   - Click "Open & Edit"

3. **Run the Game**
   - Press `F5` or click the Play button
   - Enjoy!

## Game Rules

- Start with ₹15 Lakhs
- Roll dice and move around the 40-tile board
- Buy properties to build monopolies
- Collect rent from opponents
- Mortgage properties for quick cash
- Build houses and hotels for increased rent
- Last player standing (or richest when time runs out) wins!

## Project Structure

```
opulence-godot/
├── project.godot              # Godot 4.6 config
├── README.md                  # Documentation
├── .gitignore                 # Git rules
├── scripts/
│   ├── Constants.gd           # Game data (tiles, characters, colors)
│   ├── GameManager.gd         # Core game logic
│   ├── Board.gd               # Board rendering
│   └── UI/
│       ├── MainMenu.gd        # Main menu
│       ├── GameUI.gd          # In-game UI
│       └── Lobby.gd           # Game setup
└── scenes/
    ├── MainMenu.tscn          # Menu scene
    ├── Game.tscn              # Game board scene
    └── UI/
        └── (scene files)
```

## Game Mechanics

### Property System
- **30 Properties** across 8 color groups (Brown, Light Blue, Pink, Orange, Red, Yellow, Green, Dark Blue)
- **4 Utilities** (Bonus income properties)
- **4 Railways** (Special tiles)
- **Community Chest & Chance** cards with random events

### Rent Calculation
- Base rent varies by property
- **Monopoly Bonus**: 2x rent when owning all properties in a group
- **House Multiplier**: Different rent for each house level (1-5)
- **Token Bonus**: +₹50K rent with character token placed

### Bonus Tiles
Own bonus properties to get +₹50K per salary round:
- Vortex Mall
- Pravahan Buses
- Luxor Looms
- Indus Fuels
- M.B Infrastructure

## Special Features

### Community Chest
- **Even Dice Roll**: Win ₹6-25K
- **Odd Dice Roll**: Lose ₹4-12K

### Chance Cards
- **Even Dice Roll**: Win ₹30-90K
- **Odd Dice Roll**: Lose ₹15-55K

### Jail Mechanics
- Stay in jail for up to 3 turns
- No rent collection while in jail
- Can choose to leave after 1st turn by paying

### Win Conditions
1. **Bankrupt Others**: Last player standing wins
2. **Time Runs Out**: Richest player wins
3. **₹10 Crore Milestone**: First to ₹10 Crore wealth wins

## Controls

- **Mouse**: Click tiles, buttons, and UI elements
- **Spacebar**: Roll dice (when enabled)
- **ESC**: Return to menu (optional)

## Settings

- 🔊 Sound Effects
- 🎵 Background Music
- ⏭️ Auto-Advance (10 second auto-end turn)
- ⏭️ Auto-Skip Purchase
- 💡 Strategy Hints
- ✨ Animations
- 🔊 Volume Control
- ⏰ Time Limit (0 = Unlimited)

## Characters (12 Unique Professions)

1. **IAS Officer** - Government administrator
2. **Software Engineer** - Tech professional
3. **Doctor** - Healthcare provider
4. **Chartered Accountant** - Finance expert
5. **Entrepreneur** - Business owner
6. **Farmer** - Agricultural professional
7. **Lawyer** - Legal expert
8. **Teacher** - Education provider
9. **Journalist** - News reporter
10. **Bank Manager** - Financial institution
11. **Policeman** - Law enforcement
12. **Politician** - Government official

## Currency

All amounts are in **Indian Rupees (₹)**

- Start: ₹15 Lakhs
- Salary: ₹2 Lakhs per round
- Property costs: ₹1.75 Lakhs - ₹12 Crores

## Customization

Edit `scripts/Constants.gd` to customize:
- Property names, costs, and colors
- Character names and descriptions
- Chest and Chance card values
- Salary amounts

## License

Open Source - MIT License. Feel free to modify and distribute!

## Contributing

Found a bug? Have a feature idea? Feel free to open an issue or submit a pull request!

---

**Converted from HTML to Godot 4.6** ✨

[GitHub Repository](https://github.com/chamatprakash50-collab/opulence-godot)
