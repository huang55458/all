package page;



public class Page {
	int start;  //��ʼ���ݵ�����
	int count;  //ÿҳ����
	int total;  //��������


	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * �ṩһ�����췽��
	 */
	public Page(int start,int count){
		super();
		this.start = start;
		this.count = count;
	}
	/**
	 * �ж��Ƿ�����һҳ
	 */
	public boolean isHasPreviouse(){
		if(start == 0)
			return false;
		return true;
	}
	/**
	 * �ж��Ƿ�����һҳ
	 */
	public boolean isHasNext(){
		if (start == getLast())
			return false;
		return true;
	}
	/**
	 * ����õ�����ҳ��
	 */
	public int getTotalPage(){
		int totalPages;
		if( 0 == total % count ){   //�ٸ�����  total = 20  count =10   total % count = 0 ���ó��� ������ ����if
			totalPages = total / count;  // totalPages = 20/10 =2      һ��������ҳ��
		}else{//�پٸ�����  total = 21  count =10   total % count = 1 û���� ����Ϊ1  ����else
			totalPages = total / count +1;   // totalPages = ��21/10�� +1  = 2 + 1 =3   һ������3ҳ  ǰ��ҳÿҳ10������ ���һҳһ������
		}
		//�������������  total = 0  count =10  total % count = 0
		//totalPages = 0/10 = 0   ���ǵ�һҳ����Ϊ 0 ѽ �Ǿ���ֵΪ 1 ��
		if ( 0 == totalPages){
			totalPages = 1; //��ֵΪ 1
		}
		return totalPages;  //������ҳ��
	}
	/**
	 * ����βҳ�ĵ�һ����������
	 */
	public int getLast(){
		//����ָβҳ�ĵ�һ��������������ҳ�� ������36������ һ��4ҳ ���һҳ�ĵ�һ�������������� 30
		// (ע�� �������ǰ���һҳ��һ����0��ʼ����)
		int last;
		if( 0 == total % count ){  //�ٸ�����  total = 30  count =10   total % count = 0 ���ó��� ������ ����if
			last = total - count;   // last = 30 - 10   ���һҳ��һ������Ϊ 20
		}else{ //�پٸ�����  total = 36  count =10   total % count = 6 û���� ����Ϊ6  ����else
			last = total - total % count ; // last = 36 - ��36%10��=36-6 = 30   ���һҳ��һ������Ϊ 30
		}
		//������������� total = 0  count =10  total % count = 0
		//last = total - count =0 -10 = -10
		// last<0  �������������Ǹ���  �Ǿ���Ϊ 0
		last = last<0 ? 0:last;
		return last; //����βҳ�ĵ�һ����������
	}
}

