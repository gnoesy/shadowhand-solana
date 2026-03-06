# ShadowHand (Solana + Arcium)

> ShadowHand explores how encrypted execution enables fair onchain games with hidden state.

Most card/strategy/social-deduction games break if hands, roles, inventories, or positions are public.
Traditional onchain execution makes state visible by default, which ruins gameplay.

ShadowHand is a minimal prototype built on Solana using Arcium encrypted compute.

Players keep private hands (hidden state).
Moves are submitted encrypted.
Rules are evaluated privately inside Arcium MXE.
Only rule-required reveals (and final outcomes) are emitted on-chain.

---

## Problem

Onchain games are transparent by design.

That works for open-information games, but it breaks:

- Card games (hands must be private)
- Social deduction (roles must be hidden)
- Strategy games (inventories/positions must be secret)

If everything is public:
- cheating is trivial
- bluffing is impossible
- the game collapses

---

## Solution

ShadowHand separates execution confidentiality from settlement transparency.

Encrypted:
- player hand (cards)
- player moves (play/discard)
- hidden inventory state

Revealed:
- rule-required reveals (e.g., played card)
- final round outcome
- winner / settlement result

---

## Arcium Integration

Arcium MXE performs:
- private move validation
- rule execution
- state transitions on encrypted game state
- outcome computation

Solana handles:
- game creation
- settlement recording
- minimal reveal events

Arcium becomes the confidential execution layer for gameplay.

---

## Execution vs Settlement

Execution → private (hidden hands + moves)  
Settlement → public (final outcomes + required reveals)

---

## Execution Flow

Player submits move (encrypted)  
↓  
Arcium MXE validates rules privately  
↓  
Encrypted game state updates  
↓  
Only required reveals are posted  
↓  
Round outcome settled on Solana

---

## Disclaimer

This is a structural prototype exploring encrypted execution for onchain games.
Not production-ready.
Built for Arcium RTG.
