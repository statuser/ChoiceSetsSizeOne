class Concept {
	constructor(name, att1, att2, att3, att4, att5, att6, att7) {
		this.name = "CBCSwipe_" + name;
		this.att1 = att1;
		this.att2 = att2;
		this.att3 = att3;
		this.att4 = att4;
		this.att5 = att5;
		this.att6 = att6;
		this.att7 = att7;
	}
		
	createCard() {
		let card = document.createElement("div");
		card.classList.add("card");
		card.setAttribute("style", "transform: translateX(-50%) translateY(-50%) rotate(0deg) rotateY(0deg) scale(1); touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);");
		card.innerHTML = `
			<input type="hidden" id="conceptName" name="${this.name}" /> 
			<div class="attribute">
				<div class="attribute_label">Brand</div>
				<div class="level_img">
					<!-- Begin Attribute 1 -->
					${this.att1}
					<!-- End Attribute 1 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Verified Buyer Ratings</div>
				<div class="level_img">
					<!-- Begin Attribute 2 -->
					${this.att2}
					<!-- End Attribute 2 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Mattress Type</div>
				<div class="level_label">
					<!-- Begin Attribute 3 -->
					${this.att3}
					<!-- End Attribute 3 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Firmness</div>
				<div class="level_label">
					<!-- Being Attribute 4 -->
					${this.att4}
					<!-- End Attribute 4 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Trial Period</div>
				<div class="level_label">
					<!-- Begin Attribute 5 -->
					${this.att5}
					<!-- End Attribute 5 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Warranty</div>
				<div class="level_label">
						<!-- Being Attribute 6 -->
						${this.att6}
						<!-- End Attribute 6 -->
				</div>
			</div>
			<div class="attribute">
				<div class="attribute_label">Price (Queen)</div>
				<div class="level_label">
						<!-- Begin Attribute 7 -->
						${this.att7}
						<!-- End Attribute 7 -->
				</div>
			</div>
		`;
		
		let board = document.querySelector("#board") 
		board.insertBefore(card, board.firstChild)
	}
}
