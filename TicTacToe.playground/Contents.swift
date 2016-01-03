import XCPlayground

let playgroundPage = XCPlaygroundPage.currentPage
playgroundPage.needsIndefiniteExecution = true

class Runnable: GameDelegate {
    
    let game: Game
    
    init() {
        game = Game(strategy1: MinimaxStrategy(), strategy2: RandomStrategy())
        game.delegate = self
    }
    
    func start() {
        game.startGame()
    }
    
    func didMoveAtPosition(position: CellPosition, type: PlayerType) {
        // do nothing
    }
    
    func didEnd(board: Board, results: String) {
        print(board)
        print(results)
    }
}

let runnable = Runnable()
runnable.start()