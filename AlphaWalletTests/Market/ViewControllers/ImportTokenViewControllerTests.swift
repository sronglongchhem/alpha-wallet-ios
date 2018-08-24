//Copyright © 2018 Stormbird PTE. LTD.

import FBSnapshotTestCase
@testable import Trust
import UIKit

class ImportTokenViewControllerTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        isDeviceAgnostic = true
        recordMode = false
    }

    func testImportTokenViewControllerDisplay() {
        let controller = ImportTokenViewController(config: Config())
        var viewModel: ImportMagicTokenViewControllerViewModel = .init(state: .validating)
        let ticket = Token(id: "1", index: 1, name: "", values: ["locality": "", "venue": "", "match": 9, "time": GeneralisedTime(string: "20010203160500+0300")!, "numero": 1, "category": "MATCH CLUB", "countryA": "Team A", "countryB": "Team B"])
        let ticketHolder = TokenHolder(tickets: [ticket], status: .available, contractAddress: "0x1")
        let cost: ImportMagicTokenViewControllerViewModel.Cost = .paid(eth: Decimal(1), dollar: Decimal(400))

        viewModel.ticketHolder = ticketHolder
        viewModel.state = .promptImport
        viewModel.cost = cost
        controller.configure(viewModel: viewModel)

        FBSnapshotVerifyView(controller.view)
    }
}