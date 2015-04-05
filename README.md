# ampersand-stateful-collection

Collections that maintain their own state, aside from their children.

## Usage

```javascript
var StatefulCollection = require('ampersand-stateful-collection');
var State = require('ampersand-state');

var Card = State.extend({
  props: {
    suit: 'string',
    value: 'number'
  },
  derived: {
    face: {
      deps: ['value'],
      fn: function() {
        return ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'][this.value];
      }
    }
  }
});

var CardPile = StatefulCollection.extend({
  model: Card,
  props: {
    suit: 'string',
    maxCards: ['number', -1]
  },
  derived: {
    highest: {
      deps: ['models'],
      fn: function() {
        var highest = null;
        this.forEach(function(item) {
          if ((max === null) || (item.value > highest.value)) highest = item;
        });
        return highest;
      }
    }
  }
});

var CLUB = 'CLUB';
var clubs = new CardPile([
  { suit: CLUB, value: 2 },
  { suit: CLUB, value: 7 },
  { suit: CLUB, value: 5 }
], {
  suit: CLUB
});

var pileSuit = clubs.suit; // CLUB
var highest = clubs.highest; // { value: 7 }
```