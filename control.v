module control (
    input wire rst,
    input wire clk,
    input wire a,
    input wire b,
    output wire car_enter,
    output wire car_exit
);

localparam [2:0] INVALID = 3'b000;
localparam [2:0] IDLE = 3'b001;
localparam [2:0] ENTER_A = 3'b010;
localparam [2:0] ENTER_AB = 3'b011;
localparam [2:0] ENTER_B = 3'b100;
localparam [2:0] EXIT_B = 3'b101;
localparam [2:0] EXIT_BA = 3'b110;
localparam [2:0] EXIT_A = 3'b111;

reg [2:0] state;

reg [2:0] state_next;

always @ (posedge clk, posedge rst)
    if(reset)
        state <= INVALID;
    else
        state <= state_next;

always @* begin 
    state_next = state;

    if({a,b}==2'b00)
        state_next = IDLE;
    
    case(state)
        IDLE:
            case({a,b})
                2'b01: state_next = EXIT_B:
                2'b10: state_next = ENTER_A;
                2'b11: state_next = INVALID;
            endcase
        ENTER_A:
            case({a,b})
                2'b01: state_next = INVALID;
                2'b11: state_next = ENTER_AB;
            endcase
        ENTER_AB:
            case({a,b})
                2'b01: state_next = ENTER_B;
                2'b10: state_next = ENTER_A;
            endcase
        ENTER_B:
            case({a,b})
                2'b11: state_next = ENTER_AB;
                2'b10: state_next = INVALID;
        EXIT_B:
            case({a,b})
                2'b11: state_next = EXIT_BA;
                2'b10: state_next = INVALID;
            endcase
        EXIT_BA:
            case({a,b})
                2'b10: state_next = EXIT_A;
                2'b01: state_next = EXIT_B;
            endcase
        EXIT_A:
            case({a,b})
                2'b01: state_next = INVALID;
                2'b11: state_next = EXIT_BA;
            endcase
        endcase
    end

assign car_enter = (state == (ENTER_B)) && ({a,b}==2'b00) ? 1'b1 : 1'b0;

assign car_exit = (state == (EXIT_A) && ({a,b}==2'b00) ? 1'b1 : 1'b0;

        
